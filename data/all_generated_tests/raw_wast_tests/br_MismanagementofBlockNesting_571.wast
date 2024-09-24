;; Test 2: Construct a deeply nested structure with multiple nested `blocks`. Use a `br` instruction targeting a midpoint block from deep within the nested structure. Check that the correct block is exited based on relative label lookup.

(assert_invalid
  (module
    (func $nested-br-target (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (br 2)
                (i32.const 0)
              )
              (i32.const 1)
            )
            (i32.const 2)
          )
          (i32.const 3)
        )
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)