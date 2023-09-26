
# (SC-7(7)) Prevent Split Tunneling for Remote Devices

## Definition

The information system, in conjunction with a remote device, prevents the device from simultaneously establishing non-remote connections with the system and communicating via some other connection to resources in external networks.

## Additional Guidance

This control enhancement is implemented within remote devices (e.g., notebook computers) through configuration settings to disable split tunnelling in those devices, and by preventing those configuration settings from being readily configurable by users. This control enhancement is implemented within the information system by the detection of split tunnelling (or of configuration settings that allow split tunnelling) in the remote device, and by prohibiting the connection if the remote device is using split tunnelling. Split tunnelling might be desirable by remote users to communicate with local information system resources such as printers/file servers. However, split tunnelling would in effect allow unauthorized external connections, making the system more vulnerable to attack and to exfiltration of organizational information. The use of VPNs for remote connections, when adequately provisioned with appropriate security controls, may provide the organization with sufficient assurance that it can effectively treat such connections as non-remote connections from the confidentiality and integrity perspective. VPNs thus provide a means for allowing non-remote communications paths from remote devices. The use of an adequately provisioned VPN does not eliminate the need for preventing split tunnelling.
