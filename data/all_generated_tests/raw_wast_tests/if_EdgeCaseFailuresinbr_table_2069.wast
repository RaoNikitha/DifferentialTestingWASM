;; Design a test where an `if` instruction's `then` part contains a `br_table` with legal targets and output matching the block types, whereas the `else` part contains complex branching pointing to dynamically computed invalid targets to identify differential handling.

(assert_invalid
  (module (func $complex_control (result i32)
    (block (result i32)
      (if (result i32) (i32.const 1)
        (then 
          (br_table 0 0 (i32.const 0))
        )
        (else 
          (br_table 0 (i32.add (i32.const 1) (i32.const 1)))
        )
      )
    )
  ))
  "invalid target"
)