;; 8. **Test Description 8**:    - **Scenario**: Place a `nop` after a `call` in an exception handler block within a function.    - **Constraint Check**: Ensure that the presence of `nop` does not affect the exception handling and return mechanism.    - **Relation to Improper Handling**: Validates that exceptions and function returns coexist seamlessly with `nop`.

(assert_invalid
  (module
    (type $t (func))
    (func $handle_exception
      (try 
        (call $some_function)
      catch
        (nop)
      end))
    (func $some_function))
  "unreachable executed"
)