;; 6. **Test Description**: With interleaved `block` and `loop` constructs, position a `br_if` to an outer `block` structure (label `2`). Evaluate whether the branch hits an incorrect loop or block due to mismatched label resolution.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)