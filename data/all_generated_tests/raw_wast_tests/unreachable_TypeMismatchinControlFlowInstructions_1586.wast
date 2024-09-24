;; 7. **Test Description 7:** A test where an `unreachable` is placed inside a `br` instruction branch nested in a `loop`. Verify how the implementations handle type mismatches within such complex branching structures in stack polymorphism context.

(assert_invalid
  (module (func $type-loop-nested-br-unreachable
    (block
      (loop
        (br 0 (unreachable))
      ) 
      (drop (i32.const 1))
    )
  ))
  "type mismatch"
)