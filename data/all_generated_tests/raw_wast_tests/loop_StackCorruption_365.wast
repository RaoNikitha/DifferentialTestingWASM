;; 6. **Test Description:**    - Tests loops where result types must be matched with nested `if` conditions.    - **Constraint Checked:** Stack state is consistent following conditional branching inside loops.    - **Relation to Stack Corruption:** Ensure `if` conditions don't introduce stack misalignment within a loop.    ```wasm    (module      (func (export "test") (result i32)        i32.const 1        loop (result i32)          if (result i32)            (i32.const 1)          else            (i32.const 2)          end          br_if 0        end        i32.const 3))    )    ```

(assert_invalid
  (module
    (func (export "test") (result i32)
      i32.const 1
      loop (result i32)
        if (result i32)
          (i32.const 1)
        else
          (i32.const 2)
        end
        br_if 0
      end
      i32.const 3))
  )
  "type mismatch"
)