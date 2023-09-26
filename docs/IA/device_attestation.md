
# (IA-3(4)) Device Attestation

## Definition

The organization ensures that device identification and authentication based on attestation is handled by [Assignment: organization-defined configuration management process].

## Additional Guidance

Device attestation refers to the identification and authentication of a device based on its configuration and known operating state. This might be determined via some cryptographic hash of the device. If device attestation is the means of identification and authentication, then it is important that patches and updates to the device are handled via a configuration management process such that those patches/updates are done securely and at the same time do not disrupt the identification and authentication to other devices.
