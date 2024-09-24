;; 8. **Test Description:**    Invoke a conditional branch within a series of nested `block` structures with varied result types improperly consuming all operands leading to always-true evaluations for conditions.

(assert_invalid
  (module (func $nested-br-uncontrolled (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 3 (i32.const 1) (i64.const 0)) (i32.const 1)
          )
        )
      )
    )
  ))
  "type mismatch"
)