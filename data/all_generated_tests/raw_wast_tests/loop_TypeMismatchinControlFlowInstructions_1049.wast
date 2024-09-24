;; Test 10: A `loop` with an explicit type `[] -> [i64]` but includes an `unreachable` instruction that effectively returns an `f64` value at runtime. This checks the robustness of type validation mechanisms in controlling actual stack content, especially in edge cases involving unreachable code.

(assert_invalid
  (module
    (func $loop-type-unreachable 
      (loop (result i64)
        (unreachable) 
        (f64.const 0.0)
      )
    )
  )
  "type mismatch"
)