;; 7. Design a WebAssembly module combining `block` and `loop` constructs, where a `br` targets a label in an outer block from within a deeply nested position. Insert an `unreachable` instruction within the nested block right after the `br`, testing if it halts as expected without erroneous control flow.

(assert_invalid 
  (module
    (func $deep-nesting
      (block $outer
        (loop $inner
          (block $nested
            (br $outer) 
            (unreachable)
          )
        )
      )
    )
  )
  "invalid branch target"
)