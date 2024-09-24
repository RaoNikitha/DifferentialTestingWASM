;; 1. Create a nested structure with a `call_indirect` inside a `block` followed by a `br` instruction targeting an incorrect label that supposedly leads to improper function execution due to invalid label pop.

(assert_invalid
  (module
    (type $t (func))
    (table anyfunc (elem 0 0))
    (func $nested (result i32)
      (block (result i32)
        (call_indirect (type $t) (i32.const 0))
        (br 1)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)