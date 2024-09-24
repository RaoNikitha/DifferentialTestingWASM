;; 6. **Test Description**: Invoke an imported function that, in turn, calls an exported function back in the initial module repeating several layers deep. Validate the stack to ensure no incorrect transitions occur at each return point.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $nestedFunc
      (call $externalFunc)
      (call $externalFunc)
      (return)
    )
    (func (call $nestedFunc))
  )
  "type mismatch"
)