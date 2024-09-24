;; 4. **Test Description**: Trigger a call to an out-of-bounds function index which should lead to a trap or unreachable code execution. This tests the robustness of function index validation in different implementations.

(assert_invalid
  (module
    (func (call 999999))
  )
  "unknown function"
)