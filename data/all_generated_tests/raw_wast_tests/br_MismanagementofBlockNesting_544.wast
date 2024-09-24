;; 5. **Label Index Misinterpretation:**    Create a scenario involving a series of nested `blocks` having similar labels in different contexts (one with a loop start and another without). Use `br` to target these labels and verify that the right label is targeted based on the depth, checking for any mislabeling caused by index misinterpretation.

(assert_invalid
  (module
    (func $label_index_misinterpretation
      (block 
        (block
          (block
            (loop 
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)