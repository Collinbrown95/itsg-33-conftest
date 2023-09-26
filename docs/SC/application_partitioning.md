
# (SC-2) Application Partitioning

## Definition

(A)The information system separates user functionality (including user interface services) from information system management functionality.

## Additional Guidance

Information system management functionality includes, for example, functions necessary to administer databases, network components, workstations, or servers, and typically requires privileged user access. The separation of user functionality from information system management functionality is either physical or logical. Organizations implement separation of system management-related functionality from user functionality by using different computers, different central processing units, different instances of operating systems, different network addresses, virtualization techniques, or combinations of these or other methods, as appropriate. This type of separation includes, for example, web administrative interfaces that use separate authentication methods (e.g., using a logical separation, web administrators would use 2-factor authentication and normal users of the web application would use username/password authentication). Separation of system and user functionality may include isolating administrative interfaces on different domains and with additional access controls.
