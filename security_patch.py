#automate security patch on Ubuntu
import subprocess

def install_security_patches():
    # Check for available security patches
    subprocess.run(['sudo', 'apt', 'update'])
    result = subprocess.run(['sudo', 'apt', 'list', '--upgradable'], capture_output=True, text=True)
    upgradable_packages = [line.split()[0] for line in result.stdout.split('\n') if line.startswith(' ')]
    
    # Install security patches
    if upgradable_packages:
        subprocess.run(['sudo', 'apt', 'upgrade', '-y'])
        print(f"Installed {len(upgradable_packages)} security patches.")
    else:
        print("No security patches available.")
        
if __name__ == '__main__':
    install_security_patches()
