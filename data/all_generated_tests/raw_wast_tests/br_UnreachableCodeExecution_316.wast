;; 7. Create a complex setup with multiple nested `loop`s. Branch incorrectly to an outer block within a loop context, causing the execution flow to misjump to an `unreachable` instruction.

(assert_invalid
  (module
    (func $complex-branch-nest
      (loop $outer 
        (loop $inner
          (br 2) 
        )
      )
    )
  )
  "type mismatch"
)