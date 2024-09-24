;; 2. **Test Description 2**:    - This test places a `call_indirect` instruction within a `loop` where the provided table index is out of bounds. This should trap immediately; however, due to improper boundary checking, it may incorrectly recurse into an infinite loop.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0))
    (func $out-of-bounds-loop
      (loop
        (i32.const 10)
        (call_indirect (type 0) (i32.const 5))
        (br 0)
      )
    )
  )
  "undefined elem segment"
)