;; 5. **Test Description**: Validate a `loop` using `call_indirect` where subsequent `br_if` instructions must properly direct flow control based on valid function indices.    - *Constraint Checked*: Table and function type indexing with flow control.    - *Infinite Loop Context*: Incorrect handling of `br_if` must lead to premature loop exits.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func-to-call)
    (func $func-to-call (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (local.set 0 (i32.const 0))
        (block
          (br_if 1 (call_indirect (type 0) (local.get 0) (i32.const 0)))
        )
      )
      (local.get 0)
    )
  )
  "invalid call_indirect at loop"
)