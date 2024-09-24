;; 5. **Test Description**: Implement a `call_indirect` inside a block that nests a loop with another nested block. Use `br_table` at a high stack depth to jump out of the nested block contexts, ensuring correct nesting level identification and unwinding.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $f (param i32))
    (table funcref (elem $f))
    (func $nested-call-indirect
      (block
        (loop
          (block
            (br_table 0 1 2 (i32.const 0))
            (call_indirect (type $sig) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)