
# (SC-3(3)) Minimize Nonsecurity Functionality

## Definition

MINIMIZE NON-SECURITY FUNCTIONALITY
The organization minimizes the number of non-security functions included within the isolation boundary containing security functions.

## Additional Guidance

In those instances where it is not feasible to achieve strict isolation of non-security functions from security functions, it is necessary to take actions to minimize the non-security-relevant functions within the security function boundary. Non-security functions contained within the isolation boundary are considered security-relevant because errors or maliciousness in such software, by virtue of being within the boundary, can impact the security functions of organizational information systems. The design objective is that the specific portions of information systems providing information security are of minimal size/complexity. Minimizing the number of non-security functions in the security-relevant components of information systems allows designers and implementers to focus only on those functions which are necessary to provide the desired security capability (typically access enforcement). By minimizing non-security functions within the isolation boundaries, the amount of code that must be trusted to enforce security policies is reduced, thus contributing to understandability.
