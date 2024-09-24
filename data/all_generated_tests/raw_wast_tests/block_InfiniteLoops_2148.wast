;; Test Description 9: Encode a block containing a loop and backward `br` instructions where recursive blocks and nested loops analyze the exact point of branching; improper resolution leads to infinite loops.

(assert_invalid
  (module 
    (func $block-with-loop
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br 1 (i32.const 42))
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)