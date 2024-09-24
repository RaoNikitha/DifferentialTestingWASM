;; 8. **Branching with External Function Call Condition**    - Integrate a loop where a `br_if` depends on a stack value produced by an external function call. Ensure `br_if` correctly evaluates the value returned by the function.    - **Reason**: Confirms correct handling of conditions derived from external function calls in `br_if`.

(assert_invalid
  (module (func $br_if_external_cond (param i32) (result i32)
    (local.get 0)
    block (result i32)
      loop (result i32)
        call $external_function
        br_if 0
        i32.const 0
      end
    end
  ))
  "type mismatch"
)