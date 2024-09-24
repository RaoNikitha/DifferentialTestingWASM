;; 9. Implement a scenario where a `call_indirect` is within a block that's conditioned on branch instructions. Introduce an error where the branch condition wrongly resolves, causing the indirect call to be executed in an inappropriate context with mismatched types.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i64)))
    (table 0 funcref)
    (func $branch-mismatch
      (block
        (br_if 0 (i32.const 1))
        (call_indirect (type 1) (i32.const 0) (i64.const 0))
      )
    )
  )
  "type mismatch"
)