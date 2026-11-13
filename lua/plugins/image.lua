-- Inline images in kitty (kitty graphics protocol) via snacks.nvim.
-- Opening an image file shows it in the buffer; images in markdown are rendered too.
-- Needs ImageMagick (and ghostscript for PDFs) from home.nix. Check with :checkhealth snacks
return {
  "folke/snacks.nvim",
  opts = {
    image = { enabled = true },
  },
}
