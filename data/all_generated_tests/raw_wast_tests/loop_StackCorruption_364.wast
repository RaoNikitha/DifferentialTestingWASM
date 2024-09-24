;; 5. **Test Description:**    - Involves a loop with multiple nested loops, leveraging `br_table`.    - **Constraint Checked:** Handles nested blocks with indirect branching correctly.    - **Relation to Stack Corruption:** Differentials in nested instruction execution can cause stack inconsistencies.    ```wasm    (module      (func (export "test") (result i32)        (local i32)        i32.const 0        loop          loop            loop              i32.const 1              br_table 0 1 2            end            br 0          end          br 0        end))    )    ```

(assert_invalid
  (module
    (func (export "test") (result i32)
      (local i32)
      i32.const 0
      loop
        loop
          loop
            i32.const 1
            br_table 0 1 2
          end
          br 0
        end
        br 0
      end
    )
  )
  "type mismatch"
)