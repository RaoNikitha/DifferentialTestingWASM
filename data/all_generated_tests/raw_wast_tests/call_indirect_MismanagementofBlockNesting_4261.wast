;; 10. **Test Description**: Construct a scenario with a `call_indirect` instruction nested within multiple blocks and nested loops, with each layer modifying the operand stack in different ways. This will test if the operand stack state is accurately preserved and restored across all nested frames.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $nested-call-indirect
      (block
        (loop
          (block
            (i32.const 1) (i32.const 2)
            (if
              (then
                (block
                  (loop
                    (call_indirect (type $sig) (i32.const 0))
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)