;; 6. Design a complex `br_table` instruction inside a `loop` that conditionally jumps to various loop labels based on stack values. Validate that stack alignment and contents remain intact after these conditional jumps.

(assert_invalid
  (module
    (func $complex-br_table-loop (result i32)
      (i32.const 0)
      (loop (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (br_table 0 1 2 (i32.const 1))
              (br 2))
            (br 1))
          (br 0))
        (i32.const 42))
      (i32.const 100))
  )
  "type mismatch"
)