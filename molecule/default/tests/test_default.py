"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import os

# Third-Party Libraries
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


def test_qualys_cloud_agent_installed(host):
    """Test that the Qualys Cloud Agent was installed."""
    dir_full_path = "/usr/local/qualys/cloud-agent"
    directory = host.file(dir_full_path)
    assert directory.exists
    assert directory.is_directory
    # Make sure that the directory is not empty
    assert host.run_expect([0], f'[ -n "$(ls -A {dir_full_path})" ]')


def test_qualys_cloud_agent_enabled(host):
    """Test that the Qualys Cloud Agent is enabled."""
    svc = host.service("qualys-cloud-agent.service")
    assert svc.is_enabled
