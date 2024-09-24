;; 9. **Test Description:** Deeply nested mixed blocks and loops with multiple indirect function calls inside, where each function contains a `br` targeting earlier blocks/loops.    **Constraint Checked:** Nested label resolution when `br` targets mixed structured control blocks across multiple function calls.    **Relation to Function Call/Return Handling:** Validates comprehensive branching and returns handling within complex nested structured contexts involving indirect calls.

(assert_invalid
  (module
    (func $innerFunc
      (block $block1
        (loop $loop1
          (block $block2 
            (br 2)
          )
        )
      )
    )
    (func $outerFunc
      (call $innerFunc)
    )
  )
  "invalid branch"
)