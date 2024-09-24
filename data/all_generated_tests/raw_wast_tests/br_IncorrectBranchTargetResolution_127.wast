;; Design a nested test with alternating `block` and `loop` structures. Insert a `br` instruction targeting a deeper block (`label 3`) from within a loop. Verify the correct resolution to the deeper block without defaulting to an incorrect scope.

(assert_invalid
  (module
    (func
      (block
        (i32.const 1)
        (loop
          (block
            (loop
              (block (result i32)
                (br 3)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)