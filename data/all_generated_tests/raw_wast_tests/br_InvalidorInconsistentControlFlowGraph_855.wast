;; 6. **Test Description:** Design a structure with a `loop` containing another nested `block` followed by `br` instructions that conditionally branch out to the block’s end. Validate the CFG’s ability to correctly unwind and re-stack the operand for complex nested structures.

(assert_invalid
  (module
    (func
      (loop
        (block
          (br_if 1 (i32.const 0) (nop))
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)