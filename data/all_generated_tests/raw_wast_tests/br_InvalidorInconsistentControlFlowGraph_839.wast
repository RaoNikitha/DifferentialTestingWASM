;; 10. Invalid backward branch to a loop:     Design an invalid scenario where `br` targets a label in a loop that doesn't exist (i.e., mistaken for a different loop). This should enforce the CFG's adherence to loop semantics and backward branch targeting within nested structures.

(assert_invalid
  (module
    (func $invalid-backward-branch-loop
      (block
        (loop (br 2))
      )
    )
  )
  "unknown label"
)