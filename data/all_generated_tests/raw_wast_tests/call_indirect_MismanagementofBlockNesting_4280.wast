;; 9. **Nesting depth stress test with valid and invalid function references**:    - **Description**: Test extensive nesting of blocks and loops containing multiple function references via `call_indirect`, intentionally mixing valid and invalid table indices.    - **Expected outcome**: Both implementations should trap accurately for invalid references while executing valid references properly, demonstrating the handling of nesting depth.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) 1 0)
    (func $foo (result i32)
      (i32.const 42)
    )
    (func $bar (param i32) (result i32)
      (local.get 0)
    )
    (func $test
      (block
        (loop
          (block
            (call_indirect (type 1) (i32.const 10) (i32.const 0))
          )
          (block
            (call_indirect (type 0) (i32.const 0))
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)