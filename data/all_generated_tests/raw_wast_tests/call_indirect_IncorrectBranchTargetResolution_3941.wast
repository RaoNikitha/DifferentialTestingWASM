;; 10. **Valid Operand Count but Incorrect Target Resolution**:    - Execute a `call_indirect` instruction with the correct operand count but introduced confusion in close branch targets.    - Checks for: Ensuring implementations handle nearby branch targets correctly, avoiding incorrect branch hits.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 f64)))
    (table funcref)
    (elem (i32.const 0) $unused)
    (func $f (param i32 f64) (result i32) (i32.const 0))
    (func $g
      (i32.const 1)
      (if (result i32)
        (then (call_indirect (type 0) (i32.const 0)))
        (else (call_indirect (type 1) (i32.const 0)))
      )
    )
  )
  "type mismatch"
)