export const ACADEMIC_RANKS = {
    Prof: "Phó giáo sư",
    Professor: "Giáo sư",
};

export const SHORT_ACADEMIC_RANKS = {
    Prof: "PGS",
    Professor: "GS",
};

export const mapToNamePersonnel = (user) => {
    let ranked = user?.academic_level ? SHORT_ACADEMIC_RANKS[user?.academic_level] + ". " : "";
    ranked += user?.degrees;

    return `${ranked} ${user?.last_name} ${user?.first_name}`;
};

export const DEGREES = {
    DH: "Đại học",
    CD: "Cao đẳng",
    "Th.S": "Thạc sĩ",
    TS: "Tiến sĩ",
    khac: "Khác",
};

export const GENDERS = {
    male: "Nam",
    female: "Nữ",
};
