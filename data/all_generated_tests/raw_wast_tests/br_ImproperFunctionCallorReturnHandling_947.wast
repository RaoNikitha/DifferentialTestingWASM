;; 8. Employ `call_indirect` within nested `block` constructs followed immediately by a `br` instruction targeting the outermost `loop`. This placement aims to disrupt the function call sequence and cause differential behavior in return results.

(assert_invalid
  (module
    (func $test
      (block
        (block
          (call_indirect (type $t) (i32.const 0))
          (br 2)
        )
      )
    )
    (type $t (func))
  )
  "unknown label"
)