;; 5. Embed a `br_table` instruction in a `loop` structure with edge-case indices to confirm proper resolution of backward jumps and the interaction of stack states, particularly when indices hit their extreme values.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (br_table 0 1 2 (i32.const 10) (local.get 0))
        )
      )
    )
  )
  "unknown label"
)