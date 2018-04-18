function out = tagSignatures()

persistent signature_table

if isempty(signature_table)
    signature_table = defaultTagSignatureTable;
end

out = signature_table;

function out = defaultTagSignatureTable
raw = [ ...
    "A2B0"  "AToB0"
    "A2B1"  "AToB1"
    "A2B2"  "AToB2"
    "bfd "  "under color removal and black generation"
    "bkpt"  "media black point"
    "bXYZ"  "blue matrix column"
    "bTRC"  "blue TRC"
    "B2A0"  "BToA0"
    "B2A1"  "BToA1"
    "B2D0"  "BToD0"
    "B2D1"  "BToD1"
    "B2D2"  "BToD2"
    "B2D3"  "BToD3"
    "calt"  "calibration date time"
    "targ"  "characterization target"
    "chad"  "chromatic adaptation"
    "chrm"  "chromaticity"
    "clro"  "colorant order"
    "clrt"  "colorant table"
    "clot"  "colorant table out"
    "ciis"  "colorimetric intent image state"
    "cprt"  "copyright"
    "crdi"  "CRD info"
    "devs"  "device settings"
    "dmnd"  "device manufacturer description"
    "dmdd"  "device model description"
    "D2B0"  "DToB0"
    "D2B1"  "DToB1"
    "D2B2"  "DToB2"
    "D2B3"  "DToB3"
    "gamt"  "gamut"
    "kTRC"  "gray TRC"
    "gXYZ"  "green matrix column"
    "gTRC"  "green TRC"
    "lumi"  "luminance"
    "meas"  "measurement"
    "wtpt"  "media white point"
    "ncl2"  "named color"
    "ncol"  "named color"
    "resp"  "output response"
    "rig0"  "perceptual rendering intent gamut"
    "pre0"  "preview 0"
    "pre1"  "preview 1"
    "pre2"  "preview 2"
    "psd0"  "PostScript level 2 type 1 CRD 0"
    "psd1"  "PostScript level 2 type 1 CRD 1"
    "psd2"  "PostScript level 2 type 1 CRD 2"
    "psd3"  "PostScript level 2 type 1 CRD 3"
    "ps2s"  "PostScript level 2 color space array"
    "ps2i"  "PostScript level 2 rendering intent"
    "desc"  "profile description"
    "pseq"  "profile sequence description"
    "psid"  "profile sequence identifier"
    "rXYZ"  "red matrix column"
    "rTRC"  "red TRC"
    "rig2"  "saturation rendering intent gamut"
    "scrd"  "screening conditions description"
    "scrn"  "screening information"
    "tech"  "technology"
    "vued"  "viewing conditions description"
    "view"  "viewing conditions"                      ];

out = table(raw(:,1),raw(:,2),'VariableNames',{'Signature','Name'});

