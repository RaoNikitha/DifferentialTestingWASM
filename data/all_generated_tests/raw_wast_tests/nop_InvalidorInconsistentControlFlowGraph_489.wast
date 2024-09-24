;; 10. **Test with `nop` in a Catch Block for Exception Handling:**     - Insert `nop` in catch blocks for exception handling to ensure the control flow graph continues correctly post-exception without being altered by `nop`.     - **Constraint Tested:** Ensures `nop` does not affect the execution flow within exception handling structures.

(assert_invalid
  (module
    (type $exn (func))
    (import "env" "exn" (tag $exn))
    (func $test
      try
        (do
          throw $exn
        )
        catch
          nop
        end
      )
  )
  "unreachable"
)