;; 4. Construct a `br_if` instruction within an `if-else` statement that jumps to a label outside the `if-else` scope to verify if control flow jumping out of conditional branches is handled without incorrect branch target resolution.

(assert_invalid
  (module
    (func $jump-out-if-else 
      (block 
        (if (i32.const 1) 
            (then (br_if 1 (i32.const 1))) 
            (else (nop))
        )
      )
    )
  )
  "label index out of range"
)