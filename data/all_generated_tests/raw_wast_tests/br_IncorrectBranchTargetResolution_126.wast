;; Develop a test with sequential `block` instructions, where a `br` instruction erroneously targets a `block` outside the permitted nesting scope. Confirm the test exposes incorrect label resolution and improper control flow.

(assert_invalid 
  (module 
    (func $invalid-br-target 
      (block 
        (block 
          (br 2) 
        ) 
      ) 
    ) 
  ) 
  "unknown label" 
)