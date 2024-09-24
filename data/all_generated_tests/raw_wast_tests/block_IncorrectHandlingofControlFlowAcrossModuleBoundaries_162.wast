;; 3. Use a `block` instruction encapsulating a call to an imported function that contains multiple nested `block` instructions. Ensure that nested label indices are correctly maintained and utilized.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func $complex_nested_blocks
      (block (result i32)
        (call $imported_func)
        (block
          (block
            (br 1)
          )
        )
        (i32.const 42)
      )
      (drop)
    )
  )
  "type mismatch"
)