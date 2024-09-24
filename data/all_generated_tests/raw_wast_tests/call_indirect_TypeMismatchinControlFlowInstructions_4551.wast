;; 10. **Test Description**: Establish a table with functions having consistent input types but different return types, then use a `call_indirect` within an exception handling context whose type signature doesn’t match the expected type of the called function.    - **Constraint**: Ensuring exception handling mechanisms trap on mismatched return types during indirect calls.    - **Relation**: Address type mismatches in control flow through exception handling contexts.

(assert_invalid
  (module
    (table 1 funcref)
    (type $sig (func (param i32) (result i32)))
    (type $wrong_sig (func (param i32) (result f64)))
    (func $func1 (param i32) (result i32)
      (i32.const 0))
    (elem (i32.const 0) $func1)
    (func $test
      (block
        (try
          (i32.const 0)
          (call_indirect (type $wrong_sig) (i32.const 0))
        catch_all
          (drop)
        end)
      )
    )
  )
  "type mismatch"
)