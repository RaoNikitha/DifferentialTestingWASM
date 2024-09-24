;; 8. **Test Description**:    Construct a `block` where `blocktype` specifies `i64`, but include a `loop` within the block that only maintains `i32` types and check the outer block’s type handling when the loop exits.    **Constraint**: Inner control structures must ultimately conform to outer block types.    **Relation**: Validates complex control flow type consistency.

(assert_invalid
  (module 
    (func $complex-block-loop (result i64)
      (block (result i64)
        (loop (result i32)
          (br 1 (i32.const 42))
        )
      (br 0 (i64.const 0))
      )
    )
  )
  "type mismatch"
)