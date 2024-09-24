;; 4. **Test Description**:    - Author a series of functions where `F1` calls `F2`, and `F2` calls `F3` using cascaded `call` instructions.    - Introduce branches and loops within `F2` around its `call` to `F3`.    - Ensure some branches conditionally skip the `call` to `F3` to test the resolution accuracy.    - **Constraint Checked**: Correct propagation of function type through multiple levels and branches handling.    - **Incorrect Branch Target Resolution**: Conditional branch misresolutions lead to unintended skips in the call chain causing unexpected execution flow.

(assert_invalid
  (module
    (func $F3 (param i32) (result i32) (i32.const 42))
    (func $F2 (param i32) (result i32)
      (local i32)
      (block
        (br_if 0 (i32.eq (local.get 0) (i32.const 1)))
        (local.set 1 (call $F3 (local.get 0)))
      )
      (local.get 1)
    )
    (func $F1 (param i32) (result i32)
      (call $F2 (local.get 0))
    )
    (func (param i32) (result i32)
      (call $F1 (local.get 0))
    )
  )
  "type mismatch"
)