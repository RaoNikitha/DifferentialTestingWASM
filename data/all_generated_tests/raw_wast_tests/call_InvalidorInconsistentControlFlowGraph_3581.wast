;; 10. **Exception Handling and Function Call**:    Develop a test involving exception handling constructs (try-catch blocks) with function calls inside. This checks if the CFG correctly maintains the control flow and stack operations across exception boundaries, ensuring the calls are validated and handled properly even when exceptions are thrown.

(assert_invalid
  (module
    (type (func))
    (func $try-catch-call
      try
        call 1
      catch
        call 1
      end
    )
    (func (param i32))
  )
  "type mismatch"
)