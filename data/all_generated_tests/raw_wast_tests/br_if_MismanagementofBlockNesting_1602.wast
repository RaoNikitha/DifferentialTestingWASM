;; 3. **Test 3**: Implement a `br_if` statement within nested `block` and `loop` structures, targeting a depth that is out of bounds (greater than the number of enclosing blocks). Verify the implementation raises the correct error or exception, ensuring mismanagement of block depth is appropriately handled.

(assert_invalid
  (module
    (func $depth-out-of-bounds
      (block
        (loop 
          (br_if 2 (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)