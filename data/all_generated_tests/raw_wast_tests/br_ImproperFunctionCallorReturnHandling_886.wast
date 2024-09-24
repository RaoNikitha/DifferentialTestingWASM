;; 7. Function containing multiple `block` instructions each ending with a `br` instruction targeting different `blocks`, ensuring proper operand stack handling and return behavior, looking for WebAssembly mishandling.

(assert_invalid
  (module
    (func $test
      (block (block (br 2) (i32.const 0)) (i32.const 1))
    )
  )
  "unknown label"
)