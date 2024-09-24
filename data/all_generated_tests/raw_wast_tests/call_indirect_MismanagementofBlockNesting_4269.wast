;; 8. Define an intricate control flow with nested br and br_if instructions leading to a `call_indirect`. Validate that each redirection correctly preserves the nesting levels and does not disrupt the control flow leading up to `call_indirect`.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $nested-control (param i32) (result i32)
      block
        block
          br 1
          br_if 0 (i32.const 1)
          (call_indirect (type 1) (i32.const 0))
        end
      end
    )
  )
  "type mismatch"
)