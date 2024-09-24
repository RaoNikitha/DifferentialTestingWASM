;; 5. Implement nested blocks where the innermost block contains a `loop` instruction with improper or inconsistent `br` referencing, challenging the differential engine's management of loop termination and CFG consistency. This stresses control flow branching within loops.

(assert_invalid
  (module (func $nested_block_loop_invalid_br (result i32)
    (block (result i32)
      (block (result i32)
        (loop (result i32)
          (br 2 (i32.const 5))
        )
      )
      (br 0 (i32.const 1))
    )
  ))
  "label index out of range"
)