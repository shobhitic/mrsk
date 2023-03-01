class Mrsk::Cli::Server < Mrsk::Cli::Base
  desc "bootstrap", "Ensure Docker is installed on servers"
  def bootstrap
    on(MRSK.hosts + MRSK.accessory_hosts) do

      case MRSK.manager
      when 'podman'
        execute "which podman || (apt-get update -y && apt-get install podman -y)"
      when 'docker'
        execute "which docker || (apt-get update -y && apt-get install docker.io -y)"
      else
        execute "which docker || (apt-get update -y && apt-get install docker.io -y)"
      end
    end
  end
end
