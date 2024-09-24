;; 2. Validate a `call_indirect` instruction within a loop that contains multiple `br` instructions. Ensure that a branch intended to exit the innermost loop erroneously exits the outer loop, causing the indirect function call to mismatch the expected function signature.

(assert_invalid
  (module
    (func $f (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func (param i32) (result i32)
      (loop $outer
        (call_indirect (type $sig) (local.get 0))
        (br $outer)
      )
    )
  )
  "type mismatch"
)