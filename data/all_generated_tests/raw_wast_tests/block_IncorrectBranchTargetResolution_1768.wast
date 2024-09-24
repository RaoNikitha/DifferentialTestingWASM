;; 9. A test including `block` instructions with immediate labels that go out of scope while ensuring branches do not mistakenly target these expired labels, verifying the correct lifespan and indexing of labels.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 1))
      )
      (br 2 (i32.const 2))
    )
  ))
  "label out of scope"
)